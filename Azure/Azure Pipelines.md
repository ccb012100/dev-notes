# Azure Pipelines

## Azure DevOps documentation

[Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines)

[Task Reference](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/?view=azure-pipelines&viewFallbackFrom=azure-devops)

## Pipeline features

[Azure Pipeline Features](https://learn.microsoft.com/en-us/azure/devops/pipelines/get-started/pipelines-get-started?view=azure-devops&preserve-view=true#feature-availability)

## Key Concepts

![Key concepts overview diagram](../images/Azure-Pipelines_key-concepts-overview.svg)

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

- the deployment and management service for Azure

### `Bicep`

- DSL that uses declarative syntax to deploy Azure resources
- an abstraction over `ARM` templates
- [What-if](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-what-if?tabs=azure-powershell%2CCLI)
  operation
  - preview changes in a Bicep file

## GitHub integration

Integrating with a GitHub-hosted code repository

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

## Environment

An **environment** is a collection of resources that serves as a deployment target (e.g. `Dev`, `Test`, `QA`, `Staging`,
`Production`).

If the user has the `Creator` role, the environment is created if it doesn't already exist.

2 target resource types for deployments

- Virtual Machines
- Containers

### User permissions

Split into 4 roles:

- Creator
- Reader
- User
- Administrator

## Virtual Machines (VMs)

`resourceType: virtualMachine`

**Tags** can be used to target a set of specific VMs in an environment.

## Runs

Runs represent 1 execution of a **pipeline**.

During a run, Azure Pipelines will first process the pipeline and then send the run to 1 or more agents. Each agent will
run jobs.

see: [Pipeline run sequence](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/runs?view=azure-devops)

### Job access tokens

Used by jobs to access resources in **Azure DevOps**

### Retention leases

Can change the duration that runs retained bofore being deleted.

## Steps

A step is the smallest building block of a pipeline.

Can be either a task or a script.

Each step runs in its own process, so the environment (and env variables) is not preserved between steps

### Informational Run

Created by the system when it fails to retrieve the source code.

### `Succeeded with issues` vs `failed`

If the step reports errors and/or warnings, it will be marked `succeeded with issues`.

If it explicitly reports failure (using a `##vso` command) or ends the script with a non-zero exit code, the step is
marked `failed`.

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

Scope is either `collection` or `project`.

- there are 2 corresponding built-in identities
  - the collection-scoped identity is used by default

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

([source](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml#specify-queuing-policies))

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

Defined in the `parameters` section at the beginning of a YAML and used to:

- Supply different values to scripts and tasks at runtime
- Control parameter types, allowed ranges, and defaults
- Dynamically select jobs and stages with template expressions

Can be specified in templates and in the pipeline.

Have data types and can be restricted to a subset of values.

Only available at template parsing time.

- Expanded just before the pipeline runs.
- Values surrounded `${{ }}` are replaced with parameter values.

Can't be optional.

- default value must be assigned in the YAML or when the pipeline is run

`templateContext` can be used to pass extra properties to stages, steps, and jobs that are used as parameters in a
template.

Use the `length()` expression to check whether an object parameter has no value (i.e. `${{ if eq(length(parameters.foo), 0) }}:`)

[Data types](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/runtime-parameters?view=azure-devops&tabs=script#parameter-data-types)

##### Formatting

- UNIX (macOS and Linux), format `$NAME`
- On Windows, the format is:
  - `$NAME` in Bash scripts
  - `%NAME%` in `.bat` scripts
  - `$env:NAME` in PowerShell scripts

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

## Release approvals, checks & Gates

Pre-deployment and Post-deployment conditions can be set on each stage in a release pipeline.

### Approvals & checks

Approvals and other checks aren't defined in the YAML file.

- Users modifying the pipeline YAML file can't modify the checks performed before start of a stage.
- Administrators of resources manage checks using the web interface of **Azure Pipelines**.

Checks can be configured on environments, service connections, repositories, variable groups, secure files, and agent pools.

#### Azure Function checks

Can author custom checks using **Azure functions**

By default, some pipeline run information is passed to the Azure functions in the Headers of the REST call made by Azure
Pipelines:

- `"PlanUrl": "$(system.CollectionUri)"`
- `"ProjectId": "$(system.TeamProjectId)"`
- `"HubName": "$(system.HostType)"`
- `"PlanId": "$(system.PlanId)"`
- `"JobId": "$(system.JobId)"`
- `"TaskInstanceId": "$(system.TaskInstanceId)"`
- `"AuthToken": "$(system.AccessToken)"`

#### REST API checks

Make calls to a REST API

#### Query Azure Monitor Alerts

Check **Azure Monitor** for alerts after deployment.

#### Evaluate artifact

Evaluate artifacts against custom policies.

**NOTE**: Currently only works with container image artifacts.

#### Exclusive lock

Allows only a single run from the pipeline to proceed.

Locks are held by a stage; when it completes, then another stage can proceed.

`lockBehavior` can be either `runLatest` (default if `lockBehavior` isn't set) or `sequential`

### Gates

#### Common use cases

- Incident management
- Seek approval
- Quality validation
  - query pipeline metrics
    - e.g. pass rate, code coverage
- Security scan
- User experience relative to baseline
- Change management
- Infrastructure health

## Pipeline files

preview the fully parsed YAML by going to a Pipeline's page and choosing **_More actions_ > _Download full YAML_**

## Pipeline reports

Reachable from the **Analytics" tab of a pipeline.

### Widgets

Can be added to team dashboard

#### **Test Results Trend (Advanced)** widget

Shows a trend of your test results for either build or release pipelines.

Daily counts of tests, pass rates, test duration.

## Default branch

The pipeline's default branch defines the pipeline version used for:

- manual builds
- scheduled builds
- retention policies
- pipeline resource triggers

## dotnet integration

### code coverage

Only supports the [[Visual Studio]] `.coverage` format.

#### Windows

Use built-in coverage data collector

#### Linux/macOS

Use [Coverlet](https://github.com/coverlet-coverage/coverlet)

#### diff coverage

Good for PR runs.

By default, does not block PRs from being merged; you must add a branch policy to prevent merges if the coverage status
check fails.

## Pipeline Artifacts

Used to store and manage packages.

Artifacts can be published at any stage of a build pipeline (but not _release_ pipelines)

Artifacts are stored on a Windows filesystem, so permissions need to be restored after downloading the artifact on
Linux.

By default, build artifacts are downloaded to the agent running the pipeline.

### Release artifacts

By defaults, releases run with a _collection level_ job authorization.

### Debugger symbols

Symbols can be published to **Azure Artifacts** symbol server using the _Index sources and publish symbols_ task.

### Artifact policy checks

Validate artifacts before they're deployed.

## Git

Scripts can run Git commands.

### Branch policy

You must use an ADO Git repo _and_ set up a pull request status server to enforce branch policies on PRs.

### Avoid triggering a CI build on pushes

In the commit message, or description, add any of the following:

- `[skip ci]` or `[ci skip]`
- `skip-checks: true` `or skip-checks:true`
- `[skip azurepipelines]` or `[azurepipelines skip]`
- `[skip azpipelines]` or `[azpipelines skip]`
- `[skip azp]` or `[azp skip]`
- `***NO_CI***`

## Caching

Use to improve build time by reusing files from previous runs.

Caches are immutable.

If the key contains a `.`, wrap it in double quotes so that it is not interpreted as a file path.

Caches can't be cleared, but expire after seven (`7`) days of no activity.

Cache is created after the last step of the pipeline.

### Conditioning on cache restoration

Can conditionally run steps using the `cacheHitVar` task input.

Cache hit outcome will be one of `true`, `inexact`, or `false`.

## Tests

### Test Impact Analysis (TIA)

Only runs the subset of tests that cover the code changed in the commits.

Requires some manual validation to make sure it's configured and working correctly with your codebase.

### Flaky tests

In **Project settings**, under the **Pipelines** section, click the **Test management** tab and toggle the _Flaky test
detection_ setting.

## Resources

A **resource** is anything used by a pipeline that lives outside the pipeline.

## Logging commands

Method via which tasks and scripts communicate with the agent.

### Task commands

- `AddAttachment`
- `Complete`
- `LogDetail`
- `LogIssue`
- `PrependPath`
- `SetEndpoint`
- `SetProgress`
- `SetVariable`
- `SetSecret`
- `UploadFile`
- `UploadSummary`

### Artifact commands

- `Associate`
- `Upload`

### Build commands

- `AddBuildTag`
- `UpdateBuildNumber`
- `UploadLog`

### Release commands

- `UpdateReleaseName`

### Formatting commands

Messages to the log formatter in Azure Pipelines.

Can be used in either Bash or PowerShell tasks.

#### List of commands

- `##[group]Beginning of a group`
- `##[warning]Warning message`
- `##[error]Error message`
- `##[section]Start of a section`
- `##[debug]Debug text`
- `##[command]Command-line being run`
- `##[endgroup]`

### Syntax

General format: `##vso[area.action property1=value;property2=value;...]message`

Alternate format used by a few commands: `##[command]message`
