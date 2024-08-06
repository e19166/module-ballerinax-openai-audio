# Ballerina OpenAI Audio connector

[![Build](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/ci.yml/badge.svg)](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/ci.yml)
[![Trivy](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/build-with-bal-test-native.yml/badge.svg)](https://github.com/e19166/module-ballerinax-openai-audio/actions/workflows/build-with-bal-test-native.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/e19166/module-ballerinax-openai-audio.svg)](https://github.com/e19166/module-ballerinax-openai-audio/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/e19166/ballerina-library/module/openai.audio.svg?label=Open%20Issues)](https://github.com/e19166/ballerina-library/labels/module%openai.audio)

## Overview

[OpenAI](https://openai.com/), an AI research organization focused on creating friendly AI for humanity, offers the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to access its powerful AI models for tasks like natural language processing and image generation.

The `ballarinax/openai_audio` package offers APIs to connect and interact with [Audio related endpoints of OpenAI API](https://platform.openai.com/docs/api-reference/audio/create) providing access to various models developed by OpenAI for audio-related tasks.

## Setup guide

To use the OpenAI Connector, you must have access to the OpenAI API through a [OpenAI Platform account](https://platform.openai.com) and a project under it. If you do not have a OpenAI Platform account, you can sign up for one [here](https://platform.openai.com/signup).

#### Create a OpenAI API Key

1. Open the [OpenAI Platform Dashboard](https://platform.openai.com).


2. Navigate to Dashboard -> API keys
![api-key-dashboard](https://github.com/e19166/module-ballerinax-openai-audio/blob/docs/docs/setup/resources/api-key-dashboard.png)

3. Click on the "Create new secret key" button
![create-new-secret-key](https://github.com/e19166/module-ballerinax-openai-audio/blob/docs/docs/setup/resources/create-new-secrete-key.png)

4. Fill the details and click on Create secret key
![saved-key](https://github.com/e19166/module-ballerinax-openai-audio/blob/docs/docs/setup/resources/saved-key.png)

5. Store the API key securely to use in your application  

## Quickstart

### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_audio
cd openai_audio
```

### Step 2: Invoke the audio API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.audio;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main(string fileName) returns error? {
    // Create an OpenAI audio client.
    audio:Client OpenAIAudio = check new ({
        auth: {token: openAIKey}
    });

    // Create a speech-to-text request.
    byte[] fileContent = check io:fileReadBytes(fileName);
    audio:CreateTranscriptionRequest request = {
        model: "whisper-1",
        file: {fileContent, fileName}
    };

    // Call the API.
    audio:CreateTranscriptionResponse response =
        check OpenAIAudio->/audio/transcriptions.post(request);
    io:println(response);
}
```

### Step 3: Set up your OpenAI API Key
Create a file called `Config.toml` at the root of the package directory and copy for the following content.
```toml
# OpenAI API Key
openAIKey="..."
```

### Step 4: Run the program
Use the `bal run -- audio.mp3` command to compile and run the Ballerina program.

## Examples

The `OpenAI Audio` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-openai-audio/tree/main/examples/), covering the following use cases:

[//]: # (TODO: Add examples)

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/e19166/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`openai.audio` package](https://central.ballerina.io/ballerinax/openai.audio/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
