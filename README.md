# Prime Multiplication Tables

This is json-over-http API to generate multiplication tables of a given _N_ number of primes with a javascript/react web frontend.

## Requirements
To run or test the application, install:
- docker
- docker-compose

## Running
To run the application, run

```bash
$ docker compose --profile app up
```

ctrl-c / cmd-c to stop

## Testing
To run both frontend and backend tests, run

```bash
$ docker compose --profile test up
```

ctrl-c / cmd-c to stop

## Notes

### Known shortcomings / room for improvement

- Faster sieve algorithms exist but all I remember about them is that they're far more complicated
- Lots of ways to improve the packaging / productionizing of the app
	1. API is not optimized for production deployment at all (no reverse-proxy, installs dev and test bundle groups, etc)
	1. Web app is at least slightly optimized, using the create-react-app `build` feature, but still could use some touch-up on config management
	1. Duplication between test / app containers could be refactored into multi-stage builds though really the test containers only exist for ease of running tests in this specific interview context
	1. Again with the preface that overall, dockerizing the tests is for convenience in this context only, docker-compose's combined output is a little tricky to read as well as non-deterministic; given the small number of tests, this is ok. In practice, docker-compose is not what I'd use to run tests (though docker can be an appropriate choice especially in CI settings)
	1. Error-handling / failure states on the front-end are non-existent
	1. The UX could be improved with a loading state, e.g. a loading spinner in the generate button (button could also be used to indicate error state)
- Frontend includes a pretty large amount of overhead for a very straightforward web app; for something so simple, in practice I'd opt for plain javascript and html. In this context, I did want to display React knowledge. In a true production React app, I also wouldn't rely on something like `create-react-app` but used it here for development speed and to not have to mess with webpack, babel, etc.
- Frontend tests are pretty surface level; for production scale apps, I like using snapshot tests
- Opportunity extract the API call logic into a react hook if there were ever to be additional API endpoints used

### What I like
- Clear separation of concerns in both the overall front-end / back-end split as well as within the API itself. The core logic is all implemented in classes that are completely agnostic of Rails.
- Took me back to my undergrad roots as a math (for you, Andy, maths) student in working through the prime generation piece; remembering that there is a bounding function for the size of the Nth prime (and being able to google what that function is) was clutch in being able to use the relatively straight-forward Sieve of Erasthanes.
- Again remembered from my undergrad days and not at all invented on the spot, there's a clever optimization to the sieve algorithm by starting the inner step-through at the square of the current (factor) element of the outer loop; especially as N grows large, this cuts out a significant number of iteration steps.

