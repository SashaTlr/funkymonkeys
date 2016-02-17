# FunkyMonkeys
Funky Monkeys is a survey app that uses JS and AJAX, Sinatra, and Ruby. Question and Answer forms are submitted via one post route. Forms are dynamic via jQuery to allow for additional answers to be posted to a question. Questions are presented via AJAX to users when they are taking a survey.

## Learning Competencies

* Use form controls to pass data into a server application
* Use the MVC pattern in web applications with proper allocation of code and
  responsibilities to each layer
* Implement CRUD in an MVC application
* Use jQuery

####To run app:

- Clone the repo
```bash 
$ git clone git://github.com/SashaTlr/funkymonkeys.git
```
- Navigate to local copy in Terminal and run using command
```bash 
$ bundle install
```
- Set up the database by running
```bash 
$ rake db:migrate
```
- Run server using command
```bash
$ be shotgun
```
- Navigate to localhost to view the site.

####Screenshots
Homepage has list of available surveys, with option to edit/delete surveys that you've created. Nav bar contains a log in and register link.
![Homepage](/imgs/homepage.png)

Edit page is available to user for all surveys that user has created. Additional answers can be added (via jQuery), answers can be deleted, and questions can be modified or deleted.
![Edit](/imgs/edit.png)

User can take a survey, which loads each question using AJAX request.
![Take Survey](/imgs/take_survey.png)
