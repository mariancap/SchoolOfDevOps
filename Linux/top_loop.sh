#!/bin/bash
while true; do
    echo -e "HTTP/1.1 200 OK\nContent-Type: text/html\n"
    echo "<html><head><meta http-equiv='refresh' content='10'><style>pre {font-size: 12px;}</style></head><body><h2>TOP output (refresh every 10s)</h2><pre>"
    top -b -n 1 | head -n 30
    echo "</pre></body></html>"
    sleep 10
done
