Sparrow-Doc
===========

Sparrow Doc is living documentation system which extend the living documentation which is introduced in SBE by Gojko Adzic. It can gernerate a living documentation for product feature, manual test and automation test etc. It can provide the web interface to Business, BA and QA for product feature and test case management, and provide RESTFul API for QA , DEV and CI for test case implementation and test case automation.


# webapp-main HOWTO
## Introduction
```
webapp is based on yeoman, contained YO, Grunt and bower.
web component: angularJS, bootstrap, angular-UI
```
## Quick Start
* Install environment
firstly, NODEJS runnable environment is needed.
```
npm install -g yo
cd webapp-main
npm install
bower install
```
* Start development service 
```
grunt serve
```
* Generate dist
```
grunt build
```