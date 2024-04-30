### The components of GitHub Actions:
1. Events -> Trigger the workflow runs. We may have different types of event triggers. Some exampels are:
    - Pull Request
    - Push to the specific branch
    - Issues:
      - Create
      - Close
      - Edit
    - Scheduled runs
2. Workflows -> Events are tight to workflows. Each workflow should have at least 1 job.
3. Job -> Each workflow should have at least 1 job
4. Runner -> Each job can be associated with a Runner. Runner is a machine or a compiuter engine or whatever that will perform designed steps. For example, if there are 2 jobs, they could be run on different runners in parallel or in sequence. The runners can be of 2 flavors:
    - GitHub hosted runners: Ubuntu, Windows, MacOS -> For each job we can specify different types of runners if needed
    - Self-hosted runners -> machines that are provisioned, installed and managed by you. You can decide which OS you wanna have with the required tools on it.
5. Step -> Each job composed of 1 or multiple steps. They are run on Runner in a sequence and can't be run in parallel. Each step could be either an action or shell command (let's not confuse action here with github actions, action here means abstraction of the bunch of code that is designed to something)


### Accessing Environment Variables:
- ${{github.event}} - GitHub Actions Expression Syntax -> is used to access and interpolate values from GitHub Actions context, such as event data, secrets, and workflow inputs. This syntax is specific to GitHub Actions and allows you to access dynamic values at runtime.
- "$VAR" - Shell Environment Variable Syntax -> this syntax is used to access the value of a shell environment variable.



### Yaml Template:
```yaml
name: Test Workflow Template

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  # issues:
  #   types: [opened]
  # schedule:
  #   - cron: "0 2 * * 1-5"                 # Set your workflow to run every day of the week from Monday to Friday at 2:00 UTC
  workflow_dispatch:                        # This is used for debugging purposes. It gives an opportunity to trigger the pipeline from UI with a button (without need to push and pull in this case)

jobs:
  some_job_name:
    runs-on: ubuntu-latest
    steps:
      # Step 1: Clone repo to runner using github actions.
      - name: Checkout code
        uses: actions/checkout@v2           # actions/checkout is github <owner>/<repository> while @v2 specifies the tag(version) of the reffered github action. Instead of version it is possbile to specify also the hash(id) of the release commit, for instance: @5a4ac90. Another way of refference is branch as well.
      # Step 2: creating by yourself
      - name: Run a script
        run: echo "Hello World"
        shell: bash
      # Step 3: Dump github context  
      - name: Dump github context
        run: echo '${{ toJSON(github.event) }}' | jq
        shell: bash
      # Step 4: Dump custom environment variable
      - name: Dump custom environment variable
        run: echo "$TEST_VAR"
        shell: bash
        env:
          TEST_VAR: "test"  
```