#!/usr/bin/env bash
#	default color: 178984
oldglyph=#2f3235
newglyph=#2f3235

#	Front
#	default color: 36d7b7
oldfront=#596066
newfront=#596066

#	Back
#	default color: 1ba39c
oldback=#3d4246
newback=#3d4246

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
