import argparse
import subprocess
import sys
import traceback

IMPORTANT = {
    "origin/main": "MAIN",
    "tag: prod": "PROD",
    "tag: staging": "STAGING",
    "tag: must-deploy": "MUST-DEPLOY",
}


def run():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--skip-fetch",
        action="store_true",
        help="Skip fetching the latest git repo state and tags from upstream before running this command. May show outdated prod/staging/must-deploy tags!",
    )
    args = parser.parse_args()

    if not args.skip_fetch:
        print("Fetching upstream...")
        sys.stdout.flush()
        subprocess.check_call(
            [
                "git",
                "fetch",
                "origin",
                "main",
                "--tags",
                "--force",
            ],
            stdout=sys.stdout,
            stderr=sys.stdout,  # Redirect stderr to stdout for `less`-friendliness of output
        )

    with subprocess.Popen(
        [
            "git",
            "log",
            "origin/main~1000...origin/main",
            "refs/tags/prod",
            "refs/tags/staging",
            "refs/tags/must-deploy",
            "--graph",
            "--abbrev-commit",
            "--decorate",
            "--color",
            "--pretty=format:%C(bold blue)%h%C(reset) - %C(bold green)(%cr)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)|||%D",
        ],
        text=True,
        stdout=subprocess.PIPE,
    ) as proc:
        for line in proc.stdout:
            if "|||" not in line:
                print(line, end="")
                continue
            try:
                info, decoration = line.split("|||", 1)
                decorations = decoration.strip().split(", ")
                important_decorations = list(
                    filter(lambda d: d in IMPORTANT, decorations)
                )
                minor_decorations = []
                if any(filter(lambda d: d.startswith("tag: passed-"), decorations)):
                    minor_decorations.append("passed")

                arrow_color = (
                    "\033[0;93m" if len(important_decorations) else "\033[0;32m"
                )
                new_decorations = (
                    arrow_color
                    + "  <-- "
                    + "  ".join([IMPORTANT[d] for d in important_decorations])
                    + "\033[0m"
                    + "\033[0;32m"
                    + "  ".join(minor_decorations)
                    + "\033[0m"
                    if important_decorations or minor_decorations
                    else ""
                )
                print(info + new_decorations)
            except:
                # There are probably cases I didn't think of, so provide some error info (on stdout rather than stderr to play nicely with `less` on the output pipe)
                traceback.print_exc(file=sys.stdout)
                print(line[:-1] + "     <---- ERROR PROCESSING THIS LINE")


if __name__ == "__main__":
    run()
