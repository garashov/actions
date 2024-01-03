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
