/*****************************************************************
 COPYRIGHT (C):    2013, All Rights Reserved.
 PROJECT:          TowerDefense
 FILE:             Square.h
 PURPOSE:          A Map is made up of a 2D vector of Squares - each square can contain an EnemyUnit or a Tower
 COMPILER:         i686-apple-darwin10-g++-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5664)
 TARGET:           Mac OS X
 PROGRAMMER:       Helen Wauck and Kevin Dexter
 START DATE:       01/21/2013
 *****************************************************************/
#ifndef SQUARE_H_
#define SQUARE_H_

#include <string>
#include "ccc_win.h"

class Square {
public:
	Square ();

	Square (Point location, std::string color, bool isEndSquare);

	Square(std::string color, bool isBuildable, bool isPath, Point location);

	/* PURPOSE: draws this Square in the window with the specified location and size
	*/
	void draw(Point location, double size);

	std::string get_color() const;
	bool get_buildable() const;
	bool get_path() const;
	bool get_occupied() const;
	Point get_location();

	void set_color(std::string color);
	void set_buildable(bool isBuildable);
	void set_path(bool isPath);
	void set_occupied(bool isOccupied);
	void set_location(Point location);

private:
	std::string color;

	/* REMARKS: indicates whether a tower may be built on this Square
	*/
	bool isBuildable;

	/* REMARKS: indicates whether this Square is part of a path; Players may not build towers
	 * on Squares that are part of a path
	*/
	bool isPath;

	/* REMARKS: indicates whether this Square is occupied by a Tower
	*/
	bool isOccupied;

	Point location;

	bool isEndSquare;
};


#endif /* SQUARE_H_ */
