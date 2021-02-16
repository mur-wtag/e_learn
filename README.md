# e_learn
Simple online Leaning system. This repository is designed for only backend.

## Getting Started
After cloning this repo follow these steps to setup on local environment
1. Install Rails at the command prompt if you haven't yet:
```shell
bundle
```

2. As we've provided encrypted credential file along with this repo, use these private keys by adding these files with
   this content (Note: THIS SHOULD NOT BE PROVIDED IN PUBLIC)
```ruby
# config/master.key
02d232cfd4db273beddb2ec4f91517b4
```

```ruby
# config/credentials/development.key
6e81ecd9c3b1bc099b246361a940ad7e
```

```ruby
# config/credentials/test.key
98f972639eb7ed6d7623bc99e08e7585
```

3. To create database, run
```shell
rails db:create
```

4. To run all database migration:
```shell
rails db:migrate
```

## Postman collections
As it's a backend project repository, for testing APIs you may need [Postman](https://www.postman.com/) collections for it's environment. Here is the link of the file:
[DOWNLOAD FROM HERE](https://drive.google.com/file/d/1Yw1PBbobAgoWK2fx6tiw6-SiSP0518Pj/view)

Download this file and import to your Postman to test all APIs.

## Testing
For testing I've used `rspec` framework. To run all specs, just run this command on console from the root path of the project repo:
```shell
rspec
```