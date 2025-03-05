package main

import (
    "bufio"
    "fmt"
    "log"
    "net"
)

func main() {
    // Path to the Yabai socket — adapt if yours differs
    socketPath := "/tmp/yabai_<USERNAME>.socket"

    // 1. Dial (connect) to the Unix socket
    conn, err := net.Dial("unix", socketPath)
    if err != nil {
        log.Fatalf("Failed to connect to Yabai socket: %v", err)
    }
    defer conn.Close()

    // 2. Send a command to Yabai (for example, query windows)
    //    Remember to include a newline at the end so Yabai knows the command is complete.
    command := "query --windows\n"
    if _, err := conn.Write([]byte(command)); err != nil {
        log.Fatalf("Failed to write to socket: %v", err)
    }

    // 3. Read the response
    scanner := bufio.NewScanner(conn)
    for scanner.Scan() {
        line := scanner.Text()
        fmt.Println("Received:", line)
    }
    if err := scanner.Err(); err != nil {
        log.Fatalf("Error reading from socket: %v", err)
    }
}
