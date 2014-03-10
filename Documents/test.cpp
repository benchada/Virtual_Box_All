#include <iostream>
#include <string>
using namespace std;

template <class T>
class A{
 T a;
public:
	A() {throw string("bad value"); }
	A (T x): a(x) {cout <<"A<T>::A(T)  a== " << a << endl; }
	~A() { cout<<"A<T>::~A() a == " <<a<<endl; }
};

template <>
class A <int> {
	int a;
	public:
		A(int x=0):a(x*2) { cout<< "A<int>::A(int=0) a== " << a <<endl; }
		~A() {cout<< "A<int>::~A() a== "<< a << endl; }
};

template <class T>
class B : /*virtual*/ public A <T> {
public:
	B(T x): A<T>(x) {cout<< "B::B(T) \n "; }
	~B() { cout<< "~B() \n"; }
};

class W: public B<int>, public B<string> {
	public:
	W(int x, string y): B<int>(x), B<string> (y) { cout<<"W::W(int,string) \n"; }
	~W(){cout<< "W::~W() \n"; }
};
		

main () {

	try {
		cout<< "Let's start"<<endl;
		cout<< "b1: \n";
		B<int> b1(42);
cout<< "b2: \n";
B<float> b2 (42.5);
cout<< "w: \n";
W w(6, "Hello!");
}

	catch (string s) {
	cout<< "error: "<< s <<endl; }
cout<< "end main \n ";
}

