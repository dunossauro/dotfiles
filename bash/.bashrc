#!/usr/bin/env bash

# Kyboard config
setxkbmap -model abnt -layout us -variant intl

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Envvars
if [ -e ~/.bashrc.envvars ] ; then
   source ~/.bashrc.envvars
fi

# Secrets
if [ -e ~/.bashrc.secrets ] ; then
   source ~/.bashrc.secrets
fi

# Python Env
if [ -e ~/.bashrc.python_env ] ; then
   source ~/.bashrc.python_env
fi


# Aliases
if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

# Functions
if [ -e ~/.bashrc.functions ] ; then
   source ~/.bashrc.functions
fi

# Current project
if [ -e ~/.bashrc.project ] ; then
   source ~/.bashrc.project
fi
