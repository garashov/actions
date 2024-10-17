# Hello World Action

This composite action greets someone and generates a random number.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `random-number`

A random number generated during the action.

## Example usage

### Using a public action
```yaml
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
      - uses: actions/checkout@v4
      - id: foo
        uses: OWNER/hello-world-composite-action@TAG
        with:
          who-to-greet: 'Mona the Octocat'
      - run: echo random-number "$RANDOM_NUMBER"
        shell: bash
        env:
          RANDOM_NUMBER: ${{ steps.foo.outputs.random-number }}
```

### Using a private action
```yaml
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
      - name: Checkout the repository
        uses: actions/checkout@v4
        
      - name: Use Private Action
        id: foo
        uses: ./composite_action
        with:
          who-to-greet: 'Mona the Octocat'
          
      - name: Display the Random Number
        run: echo "Random number: $RANDOM_NUMBER"
        shell: bash
        env:
          RANDOM_NUMBER: ${{ steps.foo.outputs.random-number }}
```