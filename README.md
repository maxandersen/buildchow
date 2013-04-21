BuildChow
=========

Prototype for defining jboss tools builds via a script instead of manually maintaining config.xml for each job.

How to build/use
================

First you run the build to generate the jobs.

   $ mvn verify

The resulting jobs are found in side `target/jobs`.

Now you need your jenkinsurl, username and password and run `syncjobs.sh`

   $ sh syncjobs.sh <jenkinsurl> <username> <password>

Note: syncjobs.sh is currently very crude and just create all jobs and then update them all.
It does not check if the job exists first nor does it delete jobs that are not in the list etc.
Thus be careful :)

