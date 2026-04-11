# Kitchen-ansible demo - webserver

This repository contains a simple playbook that installs nginx webserver and
deploys a simple static web page.

Kitchen allows us to test configurations on multiple target systems.  In this
repo we will deploy to CentOS-Stream-10, Debian-stable, and Fedora-42.

## The Kitchen-CI Workflow

Kitchen-CI encourages a test-driven development (TDD) workflow: write tests,
watch them fail, then implement code to make them pass.  Developers can rapidly
iterate through changes via the following methods.

### Kitchen Create

This is the first step in the process.  It spins up the defined instance(s).  This
may take up to several minutes depending on several factors such as image caching,
internet speed, driver type etc.

### Kitchen Converge

This step actually runs the ansible playbook through to completion. If there
are any errors in this step, they must be corrected. You may run
`kitchen converge` again until there are no errors and the desired state is
acheived.

### Kitchen Login

One of the coolest things you can do is actually log into the running instance of
the target you are trying to configure.  This can help troubleshooting efforts when
something isn't working the way you expect.

### Kitchen Verify

This steps runs the tests defined in the `verifier` section of `.kitchen.yml`.  This
repo utilizes pytest+testinfra to run all verifications.

### Kitchen Destroy

This destroys the instances of the test suite(s).  It does not remove container
images.  Removing images must be handled via `podman rmi` or docker driver setting.

### Kitchen Test

This command runs all of the previous steps.  This command is useful for use with
CI/CD systems to validate the changes to the codebase.

## Linters

This branch is configured to use tox to run lint checks.  These can be run manually,
but also should be run in your CI/CD automation as part of the verification process.

To run lint checks on this repo simply run the following:
```bash
tox -e linter
```

To fix python lint failures run:
```bash
tox -e fix
```

Tox handles the python environment and linter checks.  See `requirements-dev.txt` for
more info on the packages installed.
