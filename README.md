# Flutter gRPC Image Display App

## Project Overview

This project is a simple Flutter application that demonstrates the use of gRPC to fetch and display an image from a server, including the bounding boxes on the image. Users can interact with the image by clicking on a bounding box to send a cropped portion of the image back to the server. The application is designed to be simple, performant, and adheres to clean code principles.

## Features

- Fetches and displays an image from a gRPC endpoint upon launch.
- Displays bounding boxes over the fetched image.
- Allows users to click on a bounding box to send a cropped image back to the server.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/flutter-grpc-image-display.git
    ```

2. Navigate to the project directory:

    ```bash
    cd flutter-grpc-image-display
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

## Running the App

Ensure Flutter is installed on your machine and you have an emulator or physical device ready.

1. Start the application:

    ```bash
    flutter run
    ```

## Connecting to the gRPC Endpoint

The application connects to a gRPC endpoint specified in the server configuration. It makes a call to this endpoint upon launch to fetch an image and its associated bounding boxes.

### Endpoint Configuration

- **gRPC HTTPS Endpoint:** `https://assignment.coredevcentral.com/api/`
- **gRPC TCP Endpoint:** `49.13.128.217:50051`

## Implementation Notes

Upon the first launch, the application:

- Makes a gRPC call to fetch the image from the specified endpoint.
- Displays the image and its bounding boxes as received from the server.
- Enables interaction with the image, allowing users to click on a bounding box to send a cropped version of the image back to the server.

## Security Considerations

- **Certificate Pinning:** For enhanced security, it is recommended to implement certificate pinning for the gRPC web host. This ensures that your app communicates only with the specified server and prevents man-in-the-middle attacks.

## Project Structure and Code Organization

The project follows clean code principles with a clear separation of concerns, simple project structure, and intuitive naming conventions for variables, functions, and classes.

## Contributing

Contributions are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
