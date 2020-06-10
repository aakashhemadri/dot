#!/usr/bin/bash
useradd -m -G wheel ymir
passwd ymir
visudo
su - ymir
