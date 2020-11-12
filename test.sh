#! /bin/bash
cat > ./test.conf <<-EOF
Application Path: $application_path
EOF
exec bash -c "cat >> ./test.conf <<-EOF
Application Path: $application_path
EOF"

