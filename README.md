# README

### BikeShare

#### Description

Bikeshare analyzes publicly available csv data on the Bikeshare program in San Francisco. This application seeks to provide important information on the use of bike share by analyzing trips during weather conditions, trips to and from certain stations, and more. 

This application also includes a sample store with a simple checkout mechanism. You can check this out by clicking on Bike shop in the navbar! 

#### Rails version: 5.1.6

#### Configuration

* To install gems:
```
$ bundle update
$ bundle install
```

* To create and seed database:
```
$ rake db:{create,migrate,seed}
```

* How to run the test suite
```
$ rspec
```

* To view production version, visit:
```
https://polar-gorge-61101.herokuapp.com/
```

#### Possible additions:

* Adding the ability for transactions with credit cards.
* Incorporating bike share data from other cities as a comparison.
