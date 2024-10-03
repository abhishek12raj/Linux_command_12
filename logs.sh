#!/bin/bash

logs_analyze() {
    journalctl -p 3 -xb
}
