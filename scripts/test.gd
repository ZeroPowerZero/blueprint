class_name test  extends Node 
##include <iostream>
##include <vector>
#using namespace std;
#class State;
#State *currentState;
#class State
#{
#public:
	#char state;
	#string name;
	#State *a = NULL;
	#State *b = NULL;
	#State(string name, char state = 'a') : state(state), name(name) {};
#
	#void setAB(State *a, State *b)
	#{
		#this->a = a;
		#this->b = b;
	#}
	#void receive(char state)
	#{
		#this->state = state;
	#}
	#void sendTo(State *s)
	#{
		#s->receive(state);
	#}
	#void compute()
	#{
		#if (state == 'a')
		#{
			#sendTo(a);
			#currentState = a;
		#}
		#else
		#{
			#sendTo(b);
			#currentState = b;
		#}
	#}
	#void print()
	#{
		#cout << name << " State: " << state << " a = " << a->name << " b= " << b->name << "\n";
	#}
#};
#
#void printAll(vector<State> &v)
#{
	#cout << "[\n";
	#for (auto &i : v)
	#{
		#i.print();
	#}
	#cout << "]\n";
#}
#int main()
#{
	#string s = "aaabbbabbabbabbabbabbabbabaaa";
	#vector<State> automata;
	#State s4("final");
	#State s3("s3");
	#State s2("s2");
	#State s1("start");
#
	#s4.setAB(&s4, &s4);
	#s3.setAB(&s4, &s1);
	#s2.setAB(&s2, &s3);
	#s1.setAB(&s2, &s1);
	#automata.push_back(s1);
	#automata.push_back(s2);
	#automata.push_back(s3);
	#automata.push_back(s4);
	#currentState = &s1;
	#char _;
	#for (char c : s)
	#{
		#currentState->receive(c);
		#// cout << "Current : ";
		#// currentState->print();
		#// printAll(automata);
		#currentState->compute();
		#cout << "\nCurrent : ";
		#currentState->print();
		#// scanf("%c", &_);
	#}
#
	#return 0;
#}
