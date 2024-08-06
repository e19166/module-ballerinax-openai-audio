## Overview

[OpenAI](https://openai.com/), an AI research organization focused on creating friendly AI for humanity, offers the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to access its powerful AI models for tasks like natural language processing and image generation.

The `ballarinax/openai-audio` package offers APIs to connect and interact with [Audio related endpoints of OpenAI API](https://platform.openai.com/docs/api-reference/audio/create) providing access to the new DALL.E models developed by OpenAI for various audio-related tasks.

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


5.  Store the API key securely to use in your application  


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

The `OpenAI Images` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-openai-images/tree/main/examples/), covering the following use cases:

[//]: # (TODO: Add examples)
