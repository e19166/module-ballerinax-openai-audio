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