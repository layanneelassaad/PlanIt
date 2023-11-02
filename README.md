# PlanIt

## Members

- Member 1 Name: Maximo Librandi
- Member 1 UNI: ml5014
- Member 2 Name: Charlie Heus
- Member 2 UNI: ch3593
- Member 3 Name: Layanne El Assaad
- Member 3 UNI: lae2146
- Member 4 Name: Sohan Kshirsagar
- Member 4 UNI: ssk2273

## Run the project locally

Once you have cloned the repo, run the following commands to install the dependencies:

```
cd planit/
gem install bundler
bundle install
```

Then, setup the database by running `bundle exec rake db:migrate`

Finally, to run the app locally, run `rails server`

Navigate to `http://localhost:3000/` to view the app.

## Cucumber

To run the **Cucumber** tests, run `bundle exec rake cucumber` in the project folder.

## RSpec

To run the **RSpec** tests, run `rspec` in the project folder.

## GitHub and Heroku links

- GitHub: https://github.com/MaxiLibrandi/planit
- Heroku: https://gentle-scrubland-21998-519fd09748f8.herokuapp.com/