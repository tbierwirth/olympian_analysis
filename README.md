# Beacon API

## Table of Contents
* [Introduction](#Introduction)
* [Setup](#Setup)
* [GraphQL Endpoint](#Endpoint)
* [Olympian Requests](#Olympian-Requests)
* [Event Requests](#Event-Requests)
* [Schema Diagram](#Schema-Diagram)
* [Tech Stack](#Tech-Stack)
* [Project Board](#Project-Board)

### Introduction
This GraphQL API is designed to analyze data from the 2016 Summer Olympics.  Deployed to Heroku [here](https://secure-temple-77119.herokuapp.com/).

### Setup
To setup locally, run the following commands:
 - `git clone https://github.com/tbierwirth/olympian_analysis.git`
 - `cd olympian_analysis`
 - `bundle install`
 - `rails db:{create,migrate}`
 - `rake import`
 - `rails s`
 - Navigate to `localhost:3000/graphiql` to view the GraphiQL, an in-browser IDE for exploring the API

### Endpoint
All requests should be made with a `POST` request to `/graphql?query=[request]`.

### Olympian Requests

**All Olympians:**
```
{
  olympians{
    age
    weight
    team
    sport
    totalMedalsWon
  }
}
```

**Youngest Olympian:**
```
{
  youngestOlympian{
    name
    age
    weight
    team
    sport
  }
}
```

**Oldest Olympian:**
```
{
  oldestOlympian{
    name
    age
    weight
    team
    sport
  }
}
```

**Olympian Stats:**
```
{
  olympianStats{
		totalCompetingOlympians
		averageAge
		averageWeight{
		unit
		maleOlympians
		femaleOlympians
		}
  }
}

```

### Event Requests
**All Sports/Events:**
```
{
  sports{
    name
    events{
      name
    }
  }
}
```

**Medalists For Event**
```
{
  event(id: 1){
    name
    medalists{
      name
      age
      team
      medal
    }
  }
}
```

### Schema Diagram
![Olympian_Analysis Schema](https://user-images.githubusercontent.com/46985326/68159237-4792a880-ff49-11e9-9f99-5d0684310405.png)


### Tech Stack

* Rails 5.2.3
* Ruby 2.4.9
* GraphQL
* PostgreSQL

### Project Board

[Olympian Analysis Project Board](https://github.com/tbierwirth/olympian_analysis/projects/1)
