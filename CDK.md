# CDK

Amazon Web Services (AWS) Cloud Development Kit (CDK)

## Create new project

```bash
cdk init --language typescript
```

```bash
├── bin
│   └── cdk-demo.ts
├── cdk.json
├── jest.config.js
├── lib
│   └── cdk-demo-stack.ts
├── package.json
├── package-lock.json
├── README.md
├── test
│   └── cdk-demo.test.ts
└── tsconfig.json
```

## TypeScript project layout

- `bin/{PROJECT_NAME}.ts`
  - This is the entry point to your CDK application. This will load/create all the stacks we define under `lib/*`
- `lib/{PROJECT_NAME}-stack.ts`
  - This is where your main CDK application stack is defined. Your resources and its properties can go here.
- `package.json`
  - This is where you define your project dependencies, as well as some additional information and build scripts (`npm build`, `npm test`, `npm watch`).
- `cdk.json`
  - This file tells the toolkit how to run your application as well as some additional settings and parameters related to CDK and your project.

## Amazon Virtual Private Cloud (VPC)

A service that lets you launch AWS resources in a logically isolated virtual network that you define

Similar to a Kubernetes pod (I _think_)

## Environments

_source_: <https://docs.aws.amazon.com/cdk/latest/guide/environments.html>

Each `Stack` instance in your AWS CDK app is explicitly or implicitly associated with an environment (`env`). An environment is the target AWS account and region into which the stack is intended to be deployed.

### stack instantiation

#### TypeScript

`bin/{PROJECT_NAME}.ts`

#### [[.NET]]

`src/{PROJECT_NAME}/Program.cs`

### `env` property

Explicity specify the environment for a stack.

Use `CDK_DEFAULT_ACCOUNT` and `CDK_DEFAULT_REGION` to determine targe at synthesis time.

- CDK distinguishes an app setting `env` using these differenty from an environment-agostic template (one in which no environment is specified).

## Amazon Resource Names (ARNs)

An ARN is a unique identifier for an AWS resource.

Required for specifying a resource unambiguously across all of AWS

_source_: <https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html>

### ARN format

```text
arn:partition:service:region:account-id:resource-id
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id
```

_Note_: the ARNs for some resources omit the Region, the account ID, or both the Region and the account ID.
