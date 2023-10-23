# Azure Pipelines

- [Azure Pipelines](#azure-pipelines)
  - [Azure DevOps documentation](#azure-devops-documentation)
  - [Pipeline features](#pipeline-features)
  - [Key Concepts](#key-concepts)
    - [Releases](#releases)
    - [Runs](#runs)
    - [Steps](#steps)
    - [Triggers](#triggers)
    - [Library](#library)
  - [GitHub integration](#github-integration)
    - [Checkout path](#checkout-path)
    - [Sync tags](#sync-tags)
    - [Shallow fetch](#shallow-fetch)
    - [Predefined variables](#predefined-variables)
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

---

### Releases

Releases can be created 3 ways:

1. manually
2. deployment trigger
3. the REST API

### Runs

Runs represent 1 execution of a **pipeline**.

During a run, Azure Pipelines will first process the pipeline and then send the run to 1 or more agents. Each agent will
run jobs.

### Steps

A step is the smallest building block of a pipeline.

Can be either a task or a script.

### Triggers

2 kinds:

1. Build trigger
2. Release trigger

### Library

Includes **secure files** and **variable groups**

---

`Azure Resource Manager` aka `ARM`

- the deployment and management service for Azure

`Bicep`

- DSL that uses declarative syntax to deploy Azure resources
- an abstraction over ARM templates
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
