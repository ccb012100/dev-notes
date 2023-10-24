# Azure Pipelines

- [Azure Pipelines](#azure-pipelines)
  - [Azure DevOps documentation](#azure-devops-documentation)
  - [Pipeline features](#pipeline-features)
  - [Key Concepts](#key-concepts)
    - [**Azure Resource Manager** aka `ARM`](#azure-resource-manager-aka-arm)
    - [`Bicep`](#bicep)
  - [GitHub integration](#github-integration)
    - [Checkout path](#checkout-path)
    - [Sync tags](#sync-tags)
    - [Shallow fetch](#shallow-fetch)
    - [Predefined variables](#predefined-variables)
  - [Runs](#runs)
  - [Steps](#steps)
  - [Triggers](#triggers)
  - [Label sources](#label-sources)
  - [Templates](#templates)
    - [Includes templates](#includes-templates)
    - [Extends templates](#extends-templates)
    - [Reference templates in a different repository](#reference-templates-in-a-different-repository)
    - [Template parameters](#template-parameters)
      - [`templateContext`](#templatecontext)
    - [Template expressions](#template-expressions)
  - [Tasks](#tasks)
    - [Task control options](#task-control-options)
    - [Retries](#retries)
    - [Environment variables](#environment-variables)
  - [Jobs](#jobs)
    - [Job Variables](#job-variables)
    - [Job types](#job-types)
      - [Agent pool jobs](#agent-pool-jobs)
      - [Server jobs](#server-jobs)
      - [Deployment jobs](#deployment-jobs)
        - [deployment lifecycle hooks](#deployment-lifecycle-hooks)
        - [deployment strategies:](#deployment-strategies)
          - [`runOnce`](#runonce)
          - [`rolling`](#rolling)
          - [`canary`](#canary)
      - [Agentless jobs](#agentless-jobs)
      - [Container jobs](#container-jobs)
    - [Dependencies](#dependencies)
    - [Conditions](#conditions)
      - [Using template parameters in conditions](#using-template-parameters-in-conditions)
      - [Use the output variable from a job in a condition in a subsequent job](#use-the-output-variable-from-a-job-in-a-condition-in-a-subsequent-job)
      - [Use the pipeline variable created from a step in a condition in a subsequent step](#use-the-pipeline-variable-created-from-a-step-in-a-condition-in-a-subsequent-step)
        - [Scoping](#scoping)
    - [Multi-job configuration](#multi-job-configuration)
    - [Slicing](#slicing)
    - [Workspaces](#workspaces)
      - [Subdirectories](#subdirectories)
  - [Timeouts](#timeouts)
  - [Stages](#stages)
    - [Run order](#run-order)
    - [Conditions](#conditions-1)
  - [Deployment Slots](#deployment-slots)
  - [Queuing policies](#queuing-policies)
  - [Libraries](#libraries)
    - [Variable groups](#variable-groups)
      - [Variable scope](#variable-scope)
      - [User-defined variables](#user-defined-variables)
      - [User-defined multi-line variables](#user-defined-multi-line-variables)
      - [System variables](#system-variables)
      - [Environment variables](#environment-variables-1)
      - [Runtime parameters](#runtime-parameters)
        - [Formatting](#formatting)
      - [Naming restrictions](#naming-restrictions)
      - [Syntax](#syntax)
        - [Macro syntax variables](#macro-syntax-variables)
        - [Template expression syntax](#template-expression-syntax)
        - [Runtime expression syntax](#runtime-expression-syntax)
      - [Secrets](#secrets)
      - [Referencing output variables](#referencing-output-variables)
      - [List variables](#list-variables)
      - [Set variables in scripts](#set-variables-in-scripts)
        - [job-scoped](#job-scoped)
        - [Configure settable variables for setps](#configure-settable-variables-for-setps)
      - [Queue-time variables](#queue-time-variables)
        - [Option 1:](#option-1)
        - [Option 2:](#option-2)
      - [Variable expansion](#variable-expansion)
    - [Secure files](#secure-files)
    - [Logging commands](#logging-commands)

## Azure DevOps documentation

<https://learn.microsoft.com/en-us/azure/devops/pipelines>

## Pipeline features

[Azure Pipeline Features](https://learn.microsoft.com/en-us/azure/devops/pipelines/get-started/pipelines-get-started?view=azure-devops&preserve-view=true#feature-availability)

## Key Concepts

![Key concepts overview diagram](./images/Azure-Pipelines_key-concepts-overview.svg)

- A `trigger` tells a Pipeline to run.
- A `pipeline` is made up of one or more stages. A pipeline can deploy to one or more `environments`.
- A `stage` is a way of organizing jobs in a pipeline and each stage can have one or more jobs.
- Each `job` runs on one agent. A job can also be agentless.
- Each `agent` runs a job that contains one or more steps.
- A `step` can be a task or script and is the smallest building block of a pipeline.
- A `task` is a pre-packaged script that performs an action, such as invoking a REST API or publishing a build artifact.
- An `artifact` is a collection of files or packages published by a `run`.

---

- Agent
- Approvals
- Artifact
- Continuous delivery
- Continuous integration
- Deployment
- Deployment group
- Environment
- Job
- Pipeline
- Release
- Run
- Script
- Stage

### **Azure Resource Manager** aka `ARM`

- the deployment and management service for [[Azure]]

### `Bicep`

- DSL that uses declarative syntax to deploy Azure resources
- an abstraction over `ARM` templates
- [What-if](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-what-if?tabs=azure-powershell%2CCLI)
  operation
  - preview changes in a Bicep file

## GitHub integration

Integrating with a [[GitHub]]-hosted code repository

### Checkout path

- default is a directory named `s`
- can be changed in the YAML with the `checkout` property

### Sync tags

Increases pipeline run time

### Shallow fetch

setting fetch depth can make the pipeline more efficient

### Predefined variables

Azure Pipelines don't recognize the identity of a user making an update in GitHub, so the following predefined variables are set to the system identity instead:

- `Build.RequestedFor`
- `Build.RequestedForId`
- `Build.RequestedForEmail`

## Runs

Runs represent 1 execution of a **pipeline**.

During a run, Azure Pipelines will first process the pipeline and then send the run to 1 or more agents. Each agent will
run jobs.

## Steps

A step is the smallest building block of a pipeline.

Can be either a task or a script.

## Triggers

2 kinds:

1. Build trigger
2. Release trigger

## Label sources

If enabled, the build pipeline can labels the source with a Git tag. After the source is tagged, an artifact with the
Git ref `refs/tags/{tag}` is added to the completed build.

- Can be set for all or just successful builds

## Templates

Use to defined reusable content, logic, and parameters in YAML pipelines. Can also restrict what tasks are allowed to run.

You can indirectly set variables within a template by passing parameters.

You can reference a template by absolute paths (must start with `/`) or paths relative to the file that is including the
template.

### Includes templates

For reusable content; used to insert content into another file.

### Extends templates

Control what is allowed in a pipeline. Defines logic that another file must follow.

### Reference templates in a different repository

Use the `resources` -> `repositories` specification to set up references to templates in other repositories.

You then use `@name-you-gave-it` after the template name to reference it, e.g. `common.yml@templates-repo`

The templates are resolved at pipeline start up and only the template files are used. Scripts from other repositories
can't be used in your pipeline.

### Template parameters

Must contain a name and data type

#### `templateContext`

Used to pass properties to templates.

Bundles a job and its environments properties object together.

Makes it easier to set up environments when processing each job.

### Template expressions

Used for dynamic resolution.

Expressions are wrapped in `${{ }}`.

Only predefined variables can be used in template expressions. Runtime variables are not available to template
expressions

Expressions are only expanded for `stages`, `jobs`, `steps`, and `containers` (inside `resources`).

To escape a value containing `${{`, wrap the value in single quotes (`'`) (single quotes can be escaped inside a wrapped value with a double single-quote (`''`)).

## Tasks

You must always specify the major version of a task used in a pipeline.

### Task control options

```yaml
- task: string                    # reference to a task and version, e.g. "VSBuild@1"
  condition: expression           # if not set, defaults to only running if previous dependencies have succeeded
  continueOnError: boolean        # 'true' if future steps should run even if this step fails; defaults to 'false'
  enabled: boolean                # whether or not to run this step; defaults to 'true'
  retryCountOnTaskFailure: number # Max number of retries; default is zero
  timeoutInMinutes: string        # how long to wait before timing out the task
  target: string                  # 'host' or the name of a container resource to target
```

### Retries

`retryCountOnTaskFailure` defaults to `0`.

### Environment variables

Each task has an `env` property that contains a list of string pairs.

## Jobs

Sereis of steps that run sequentially as a unit.

Smallest unit of work that can be scheduled to run.

### Job Variables

Variables can be specified on the job.

- can be passed to inputs using the macro syntax $(variableName)
- can be accessed within a script using the stage variable

### Job types

#### Agent pool jobs

Run on an agent in an agent pool.

Most common type of job.

Each job in a pipeline gets a fresh agent.

#### Server jobs

Tasks in a server job are orchestrated by and executed on the server (Azure Pipelines).

Doesn't require any agent or target computers.

Maximum time for a server job is 30 days.

#### Deployment jobs

Collection of steps that are run sequentially against the environment.

Deployment jobs provide deployment history

- history across piplelines, down to a specific resource and status of the deployments for auditing

Any steps defined in a deployment job with a VM resource will run against that VM and not against the agent in the pool.

##### deployment lifecycle hooks

By default, hooks inherit the `pool` specified by the `deployment` job.

1. `preDeploy`

   - Run steps that initialize resources before application deployment starts.

2. `deploy`

   - Run steps that deploy your application.
   - Download artifact task will be auto injected only in the `deploy` hook for deployment jobs.
   - To stop downloading artifacts, use `- download: none` or choose specific artifacts to download by specifying
    **Download Pipeline Artifact** task.

3. `routeTraffic`
   - Run steps that serve the traffic to the updated version.

4. `postRouteTraffic`
   - Run the steps after the traffic is routed.
   - Typically, these tasks monitor the health of the updated version for defined interval.

5. `on: failure` or `on: success`
   - Run steps for rollback actions or clean-up.

##### deployment strategies:

###### `runOnce`

Simplest strategy

All lifecycle hooks are executed once

###### `rolling`

Replaces instances of the previous version of an application with instances of the new version of the application on a
fixed set of virtual machines (rolling set) in each iteration.

Typically waits for deployments on each set of virtual machines to complete before proceeding to the next set of
deployments. You can do a health check after each iteration and if a significant issue occurs, the rolling deployment
can be stopped

Limitation: retrying a stage re-runs the deployments on all VMs, not just the failed targets.

###### `canary`

Roll out changes to a small subset of servers first.

#### Agentless jobs

Tasks supported out of the box for agentless tasks:

- Delay task
- Invoke Azure Function task
- Invoke REST API task
- Manual Validation task
- Publish To Azure Service Bus task
- Query Azure Monitor Alerts task
- Query Work Items task

See: [Agentless jobs supported Tasks](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/phases?view=azure-devops&tabs=yaml#agentless-tasks)

#### Container jobs

See: [Define container jobs](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops)

### Dependencies

`dependsOn` can be used to specify dependencies between jobs in a single stage.

Jobs will run parallel if they have no dependencies on each other.

### Conditions

Default: a job runs if it doesn't depend on any other job, or if all the jobs that it depends on have completed and succeeded.

Conditions can access variables from previous jobs (but only in directly dependent jobs).

#### Using template parameters in conditions

When you declare a parameter in the same pipeline that you have a condition, parameter expansion happens before conditions are considered.

#### Use the output variable from a job in a condition in a subsequent job

You can make a variable available to future jobs and specify it in a condition. Variables available to future jobs must be marked as multi-job output variables using `isOutput=true`.

#### Use the pipeline variable created from a step in a condition in a subsequent step

By default, variables created from a step are available to future steps.

##### Scoping

- Variables created in a step in a job will be scoped to the steps in the same job.
- Variables created in a step will only be available in subsequent steps as environment variables.
- Variables created in a step can't be used in the step that defines them.

### Multi-job configuration

A job using the `matrix` strategy can run multiple jobs on multiple agents in parallel.

Can use output variables to generate a matrix by supplying a runtime expression containing a stringified JSON object.

### Slicing

Use the `parallel` strategy to run a suite of tests in parallel.

The Visual Studio Test task supports test slicing.

### Workspaces

Agent pool jobs create a workspace on the agent.

Directory in which it downloads the source, runs steps, and produces outputs.

Can be referenced in the job using the `Pipeline.Workspace` variable.

#### Subdirectories

- `Build.SourcesDirectory`
  - where tasks download the application's source code.
- `Build.ArtifactStagingDirectory`
  - where tasks download artifacts needed for the pipeline
  - where tasks upload artifacts before they are published.
- `Build.BinariesDirectory`
  - where tasks write their outputs.
- `Common.TestResultsDirectory`
  - where tasks upload their test results

Prior to every build, `$(Build.ArtifactStagingDirectory)` and `$(Common.TestResultsDirectory)` are always deleted and
recreated.

## Timeouts

If not specified, `timeoutInMinutes` defaults to `60`.

`cancelTimeoutInMinutes` defaults to `5`.

If the pipeline has a job-level timeout, it supersedes the task-level timeouts.

## Stages

Logical boundary in the pipeline where you can pause the pipeline and perform various checks.

Can be used to mark separation of concerns (for example, build app, run tests, deploy to QA).

Every pipeline implicitly has at least 1 job.

If `pool` is specified on a stage, then all jobs defined in that stage will use that pool (unless the job specifies a
pool).

### Run order

By default, if you define multiple stages in a pipeline, they run sequentially, in the order they are defined.

To run stages in parallel, use `dependsOn: []` to remove the implicit dependency on a previous stage.

### Conditions

Specifying a `condition` on a stage removes the implicit conditions for previous stages to complete and succeed.

- Use `and(succeeded(), custom_condition)` or the stage even if the previous stage fails.

## Deployment Slots

  > In the Cloud Shell, swap the verified/warmed-up staging slot into production.
  >
  > ```bash
  > az webapp deployment slot swap --name $webappname --resource-group AzureTutorial --slot staging
  > ```

- Disconnect local Git deployment

- **Triggers** tab
  - checkbox labeled _Batch changes while a build is in progress_
    - directly under checkbox labeled _Enable continuous integration_

## Queuing policies

> YAML pipelines don't support queuing policies. Each run of a pipeline is independent from and unaware of other runs.
> In other words, your two successive commits may trigger two pipelines, and both of them will execute the same sequence
> of stages without waiting for each other. While we work to bring queuing policies to YAML pipelines, we recommend that
> you use manual approvals in order to manually sequence and control the order the execution if this is of importance.

_source_: <https://learn.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml#specify-queuing-policies>

## Libraries

A library is a collection of build and release assets for an Azure DevOps project.

Assets defined in a library can be used in multiple build and release pipelines of the project.

The **Library** tab can be accessed from the **Azure Pipelines** section in Azure DevOps.

The library contains two types of assets: variable groups and secure files.

### Variable groups

Variables can be used with expressions to conditionally assign values

Different from runtime parameters, which are typed and available during template parsing.

#### Variable scope

- **root**
  - available to all jobs in the pipeline
- **stage**
  - available only to a specific stage
- **job**
  - available only to a specific job

Variable names can be shadowed.

- The narrowest scope wins

Global variables defined in a YAML aren't visible in the pipeline settings UI.

#### User-defined variables

Can be defined at the root, stage, and job level.

If done through the UI, they can be encrypted and set as secret.

**Variable groups** can be used to make variables

#### User-defined multi-line variables

Tricky, limited. See: [User-defined multi-line variables](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#user-defined-multi-line-variables)

Can be set as read-only.

#### System variables

See: [List of pre-defined system values](https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml)

#### Environment variables

Specific to the pipeline's OS.

System and user-defined variables are also injected into the pipeline as environment variables.

- Names are converted to uppercase, and periods (`.`) turn into underscores (`_`)

#### Runtime parameters

##### Formatting

- UNIX ([[macOS]] and [[Linux]]), format `$NAME`
- On [[Windows]], the format is:
  - `$NAME` in [[Bash]] scripts
  - `%NAME%` in `.bat` scripts
  - `$env:NAME` in [[PowerShell]] scripts

#### Naming restrictions

Names must consist of letter, numbers, `.`, and `_`.

Disallowed prefixes:

- `endpoint`
- `input`
- `path`
- `secret`
- `securefile`

#### Syntax

3 types: `macro`, `template expressione`, `runtime expression`

| Syntax | Example | When is it processed? | Where does it expand in a pipeline definition? | How does it render when not found? |
|---|---|---|---|---|
| macro | `$(var)` | runtime before a task executes | value (right side) | prints `$(var)` |
| template expression | `${{ variables.var }}` | compile time | key or value (left or right side) | empty string |
| runtime expression | `$[variables.var]` | runtime | value (right side) | empty string |

##### Macro syntax variables

`$(var)`

Processed during runtime

- after template expansion
- before a task runs

Replaced by the system with the contents of the variable.

- If there's no variable by that name, then the macro expression does not change and it left as-is.

Can only be used in **stages**, **jobs**, and **steps**.

Can only be used as a value, not a keyword.

##### Template expression syntax

`${{ variables.var }}`

Processed at compile time, before runtime starts.

##### Runtime expression syntax

`$[variables.var]`

Processed during runtime.

Intended to be used with conditions and expressions.

Must take up the entire right side of a definition.

#### Secrets

Set in **Variables** pipeline settings UI.

Scoped to the pipeline

- available on the agent for tasks and scripts to use.

Secrets are not mapped automatically to env variables and have to be done explicitly

#### Referencing output variables

To reference a variable from a:

- different task within the same job: use `TASK.VARIABLE`.
- task from a different job: use `dependencies.JOB.outputs['TASK.VARIABLE']`.

#### List variables

```bash
# by id
az pipelines variables list --pipeline-id ID

# by name
az pipelines variables list --pipeline-name NAME

# by project name or id
az pipelines variables list --project NAME_OR_ID
```

Add `--output-table` to list the variables in table format

#### Set variables in scripts

##### job-scoped

Use the `task.setvariable` logging command.

Available as environment variables in to subsequent jobs and steps (but not the step in which the variable is defined) .

Available with macro syntax in subsequent jobs.

Use `issecret` to set the variable as a secret.

##### Configure settable variables for setps

Use `settableVariables` to `none` to disable setting variables, or specify specific variables that are allowed to be set.

#### Queue-time variables

Can be set in 1 of 2 ways. The variable must not be set in the YAML, or the YAML value will take precedence.

##### Option 1:

define a variable in the UI and check the option _Let users override this value when running this pipeline_

- should only be used for secrets

##### Option 2:

Use **runtime parameters**

- preferred way if variable is not secret

#### Variable expansion

When you set a variable with the same name in multiple scopes, the following precedence applies (highest precedence first).

1. Job level variable set in the YAML file
2. Stage level variable set in the YAML file
3. Pipeline level variable set in the YAML file
4. Variable set at queue time
5. Pipeline variable set in Pipeline settings UI

Variables are expanded when the run is started, and again at the beginning of each step.

Variables referenced using macro syntax (`$( )`) are expanded recursively.

### Secure files

### Logging commands

see: [Loggin commands](https://learn.microsoft.com/en-us/azure/devops/pipelines/scripts/logging-commands?view=azure-devops&tabs=bash)
