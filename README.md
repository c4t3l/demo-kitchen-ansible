# Kitchen-ansible demo - webserver

This repository contains a simple playbook that installs nginx webserver and
deploys a simple static web page.

Kitchen allows us to test configurations on multiple target systems.  In this
repo we will deploy to CentOS-Stream-10, Debian-stable, and Fedora-42.

## Kitchen Create

This is the first step in the process.  It spins up the defined instance(s).

## Kitchen Converge

This step actually runs the ansible playbook through to completion. If there
are any errors in this step, they must be corrected. You may run
`kitchen converge` again until there are no errors and the desired state is
acheived.

## Kitchen Verify

This steps runs the tests defined in the `verifier` section of `.kitchen.yml`.

## Kitchen Destroy

This destroys the instances of the test suite(s).  It does not remove container
images.  Removing images must be handled via podman rmi etc.

## Kitchen Test

This command runs all of the previous steps.  This command is useful for use with
CI/CD systems to validate the changes to the codebase.

