# Display # for root
# and nothing otherwise
userIndicator=""
if [ $USER = "root" ]
then
  userIndicator="# "
fi

# Get the working directory
# Only basename
path="\W"

# Right prompt
leftPrompt() {
  # Get the git branch if any
  gitBranch=$(git branch 2> /dev/null | \
    sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')

   left="$userIndicator$path$gitBranch "
}

# Left prompt
rightPrompt() {
  padding=$(expr ${COLUMNS} - ${#right})
  right= $(printf "%*s" $padding "right prompt")
}

# The prompt
prompt() {
  leftPrompt
  # rightPrompt

  PS1="$left"
}

# Re-evalute what's in the prompt function
PROMPT_COMMAND=prompt

