----------------------------------------------------------------------------
            How to access our CMIP6-NG data server over rsync
----------------------------------------------------------------------------

In short:

Rsync-Server:   atmos.ethz.ch
Directory:	cmip6-ng
Username:       cmip6ng
Password:       useatyourownrisk

Please do not share the username/password with others. Tell them they should get in touch with us.

On Linux/Unix/MacOSX use the command rsync.

List the content of cmip6 data pool
# RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt cmip6ng@atmos.ethz.ch::cmip6-ng

Get this README File:
# RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt cmip6ng@atmos.ethz.ch::cmip6-ng/README-rsync.txt .

Rsync the whole cmip6-ng data pool:
# RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt --delete cmip6ng@atmos.ethz.ch::cmip6-ng cmip6-ng

Rsync only files listed in list.txt:
# RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt --files-from=list.txt cmip6ng@atmos.ethz.ch::cmip6-ng cmip6-ng

We recommend to use the option --delete to get an exact mirror of our data.
In case you are not quite sure what your rsync command is doing, use option -n (perform a trial) in advance!

Use option "-z" to enable data compression:
# RSYNC_PASSWORD=useatyourownrisk rsync -vrlptz --delete cmip6ng@atmos.ethz.ch::cmip6-ng cmip6-ng

Please note:
1) rsync will OVERWRITE the file in your local copy, in case the file is different on our data server.
2) If we delete a file on our data server, rsync will per default not delete the file in your local copy. 
   Use the option --delete to allow rsync to delete files in your local copy.

For more detail see "man rsync"

----------------------------------------------------------------------------
Urs Beyerle, IAC/ETHZ
