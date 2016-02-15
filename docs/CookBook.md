vagrant

vagrant init ubuntu/trusty64; vagrant up --provider virtualbox

#vagrant destroy -> deletes vm and drives

#vagrant reload --provision

#create box from existing
https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
#vagrant package --output basedev.box
vagrant box add basedev basedev.box
