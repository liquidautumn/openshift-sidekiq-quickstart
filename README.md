OpenShift Sidekiq Quickstart
=============================

This is a [Sidekiq](http://sidekiq.org/) that runs the Sidekiq on OpenShift.


Prerequires
------------

1. Create 'ruby' application on OpenShift
2. Copy the `.openshift` and `Gemfile` and `workers.rb` to your application
3. You need to install the [Redis cartridge](https://github.com/smarterclayton/openshift-redis-cart)

How it works?
---------------

This quickstart will spawn the Sidekiq worker handler and read the `workers.rb`
file from your repo dir.
For that you need to require all workers there. See the `ExampleWorker` example.

To check it works properly, deploy this quickstart, and run:

```
$ rhc ssh app_name
$ tail -f $OPENSHIFT_DATA_DIR/sidekiq.log
```

You should see something like:

```
2013-08-12T12:27:30Z 18310 TID-7l958 INFO: Booting Sidekiq 2.13.1 using redis://:ZTNiMGM0NDI5OGZjMWMxNDlhZmJmNGM4OTk2ZmI5@127.8.77.130:16379 with options {}
2013-08-12T12:27:30Z 18310 TID-7l958 INFO: Running in ruby 1.9.3p448 (2013-06-27) [x86_64-linux]
2013-08-12T12:27:30Z 18310 TID-7l958 INFO: See LICENSE and the LGPL-3.0 for licensing details.
2013-08-12T12:27:30Z 18310 TID-7jwuw ExampleWorker JID-5a31f482c7fe15f04ba7aa1a INFO: start
Performing the example worker task...
Finished!
2013-08-12T12:27:32Z 18310 TID-7jwuw ExampleWorker JID-5a31f482c7fe15f04ba7aa1a INFO: done: 2.0 sec

```
