RORR
====

Research about Ruby, ROR, Rspec, Cucumber.
Ruby :
 - basicdemo.rb : training about Array, String, Hash, Sort, If, Loop, Block, Proc, Lambda
 - class.rb : training about use Object, class, def
 - lblowfish.rb : demo create class blowfish

ROR :
 - training use ROR (demo about manages insert, update, delete, select, session, cookie)

Rspec :
  - Test

Cucumber :
  - Test


Suport Use Mysql for Rails :

Step 1 : brew install mysql
Step 2 : gem install mysql2
Step 3 : rails new projectName -d mysql


View PId of Rails :
Step 1 : lsof -wni tcp:3000
Step 2 : kill -9 {PID}

How change version rails
Step 1 : gem uninstall rails
Step 2 : gem uninstall railties
Step 3 : gem update rails 3.2.13


Run by Unicorn :
	bundle exec unicorn_rails -c config/unicorn.rb -E development

Run with production :
 - change config/environments/production.rb : config.assets.compile = true
