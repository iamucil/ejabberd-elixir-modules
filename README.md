# ejabberd-elixir-modules

Create folder in ejabberd installation

  mkdir -p ${EJABBERD_HOME}/.ejabberd-modules/sources/ejabberd-contrib

Put your modules into ejabberd-contrib directory, and run

  ejabberdctl modules_update_specs
  ejabberdctl modules_available

If your modules appear,then let's give a try install your module

  ejabberdctl module_install mod_name
