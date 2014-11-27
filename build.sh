#!/bin/bash

$(cd wordpress; sudo docker build -t example/wordpress .)
$(cd mysql; sudo docker build -t example/mysql .)

