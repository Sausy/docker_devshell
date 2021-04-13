#/bin/bash



export ROS_IP=$(hostname -I|head -n1 | awk '{print $1;'})
source /opt/ros/melodic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/custom/lib

rostopic list

while [[ 1 ]]; do
  sleep 120 &
  wait $!
done
