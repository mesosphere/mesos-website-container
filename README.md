# mesos-website-container
Docker build scripts for generating mesos.apache.org from remote or local sources.

Building the docker image:

```
git clone https://github.com/mesosphere/mesos-website-container.git
cd mesos-website-container
docker build -t mesosphere/mesos-site .
```

To build and run the website inside a docker container.

```
docker run -it --rm -p 4567:4567 mesosphere/mesos-site
```

This will start a container, download sources from SVN and Git, generate the website and make it available.
On linux, the site will be available at http://localhost:4567.
On OSX, run `docker-machine ls` to find the IP address of your docker VM; the site will be available at that IP, port 4567.

## Local SVN

If you want to use a local copy of the svn repo, clone it, and then mount it as a volume (which gets passed as a parameter to `run_site.sh`):

```
svn co https://svn.apache.org/repos/asf/mesos/site/ /home/me/dev/svn/mesos-site
docker run -it --rm -p 4567:4567 -v /home/me/dev/svn/mesos-site:/site mesosphere/mesos-site /tmp/run_site.sh /site
```

Any changes to the svn `/publish` directory (static content) will cause middleman to reload and regenerate the website, so you can just edit, save, refresh.
When you are done with the webserver, hit Ctrl-C in the docker terminal to kill the middleman webserver and destroy/remove the container.

## Local Docs

The `/documentation` part on the website is pulled/converted from the `/docs` folder in the git repo. To use a local copy of the git repo (and docs):

1. Clone the [git repo](https://github.com/apache/mesos) (to, say, `/home/me/dev/mesos`).
2. Open the `Rakefile` from the SVN repo and replace the `mesos_dir` variable with `/git`.
3. Use `-v` to mount the local Mesos source into `/git`.

```
docker run -it --rm -p 4567:4567 -v /home/me/dev/svn/mesos-site:/site -v /home/me/dev/mesos:/git mesosphere/mesos-site /tmp/run_site.sh /site
```

