#!/bin/bash

function update() {
  yum update -y
}

function installAndConfigureAIDE() {
  # Install AIDE
  yum install -y aide

  # Move the user uploaded configuration file
  mv ${UPLOADS_DIR}/aide.conf /etc/aide.conf
}

function installAndConfigureAuditd() {
  # Install auditd
  yum install -y audit

  # Create the log file directory used in the configuration file
  mkdir /var/log/audit/stacksmith/

  # Move the user uploaded configuration file
  mv ${UPLOADS_DIR}/auditd.conf /etc/audit/auditd.conf
}

update
installAndConfigureAIDE
installAndConfigureAuditd
