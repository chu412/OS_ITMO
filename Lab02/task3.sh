#!/bin/bash
ps u | tail -1 | awk '{print $2}'