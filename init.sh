#!/usr/bin/env bash
DOT_DIRECTORY="${HOME}/dotfiles"

CURRENT_ABS_DIRECTORY="$(cd $(dirname $0); pwd)"

# Running this script on not home dir then.
if [ ${CURRENT_ABS_DIRECTORY} != ${DOT_DIRECTORY} ]; then
  ln -sf "${CURRENT_ABS_DIRECTORY}" "${DOT_DIRECTORY}"
fi

cd ${DOT_DIRECTORY}

# dein init
rm -rf "${DOT_DIRECTORY}/dein/repos"
echo 'rm -rf ${DOT_DIRECTORY}/dein/repos'
chmod +x ${DOT_DIRECTORY}/dein/installer.sh
echo 'chmod +x ${DOT_DIRECTORY}/dein/installer.sh'
/bin/sh -C "${DOT_DIRECTORY}/dein/installer.sh ${DOT_DIRECTORY}/dein"
echo "$(tput setaf 1)You don't need to write dein setting in .vimrc.$(tput sgr0)"

# dotfiles auto settings.
for f in .??*
do
  # ignore settings
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = "nvim/autoload" ]] && continue
  [[ ${f} = "nvim/colors" ]] && continue
  [[ ${f} = "nvim/init.vim" ]] && continue
  [[ ${f} = "nvim/userconfig" ]] && continue
  [[ ${f} = "nvim" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo "$(tput setaf 2)Deploy dotfiles complete!. $(tput sgr0)"

# nvim files settings.
# ln -sf "${DOT_DIRECTORY}/.vim/autoload" "${DOT_DIRECTORY}/nvim/autoload"
# ln -sf "${DOT_DIRECTORY}/.vim/colors" "${DOT_DIRECTORY}/nvim/colors"
ln -sf "${DOT_DIRECTORY}/.vim/userconfig" "${DOT_DIRECTORY}/nvim/userconfig"
ln -sf "${DOT_DIRECTORY}/.vimrc" "${DOT_DIRECTORY}/nvim/init.vim"
echo "$(tput setaf 2)Deploy nvim settings complete!. $(tput sgr0)"

# nvim load settings.
if grep XDG_CONFIG_HOME ${HOME}/.bashrc > /dev/null 2>&1; then
  echo 'exist XDG_CONFIG_HOME settings.'
  echo 'Please, check your XDG_CONFIG_HOME with .bashrc'
else
  echo 'Please, write your XDG_CONFIG_HOME in .bashrc or .bash_profile.'
  echo 'export XDG_CONFIG_HOME="${HOME}/.config"'
fi
ln -sf "${DOT_DIRECTORY}/nvim" "${HOME}/.config"

