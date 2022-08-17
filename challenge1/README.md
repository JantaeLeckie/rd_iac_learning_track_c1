# vue-starter

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Run your tests
```
npm run test
```

### Lints and fixes files
```
npm run lint
```

### Run your end-to-end tests
```
npm run test:e2e
```

### Run your unit tests
```
npm run test:unit
```

## Infrastructure As Code (IAC)
Core Components
- Makefile - describes the abstracted commands avaliable used to shorten the execution process
- .infra - Contains IAC specific code for constructing any configured environment along with their respective variables 
- Terraform - IAC runtime and configuration language


### Pre-requisits
- Setup AWS IAM user credentials in ./.infra/meta/.aws

- Setup SSH public key with access to your bitbitbucket account in ./.infra/meta/.ssh

### How to run?

Use docker-compose to aggrigate all environment settings. Using the following command runs the container and injects the selected variables and volumes.

Run the following from the ./.infra folder
```
docker-compose up -d
```
and run ``` docker exec -it <container name here> bash```

Once the container is running and you have access to the container, run ``` make ``` to see the list of availiable commands and their respective descriptions



