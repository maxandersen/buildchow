BuildChow
=========

Prototype for defining jboss tools builds via a script instead of manually maintaining config.xml for each job.

How to build/use
================

First you need to install jenkins-job-builder

   $ pip install jenkins-job-builder

You should now be able to run this to generate the xml for the jobs:

   $ jenkins-jobs  test jobs-streams.yaml -o jobs

The resulting jobs are found inside `jobs`.

Setup jobs in Docker Jenkins
=

First make sure you have docker installed (if on OSX/windows use
boot2docker):

The following assumes you have `dockerhost` in your `/etc/hosts`
pointing to wherever your docker host is running.

Now run this in on terminal:

   $ docker run -p 8080:8080 jenkins

If it is the first time it needs to download an image of jenkins. Next
startups will be fast.

Once this completes opening http://dockerhost:8080 should show you a
local running jenkins.

Now you can run this to send the jobs to this docker backed jenkins:

   $ jenkins-jobs --conf dockerjenkins.ini update jobs-streams.yaml

This uses `dockerjenkins.ini` which assumes `dockerhost` resolves to
your docker run jenkins.

