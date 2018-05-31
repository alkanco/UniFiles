#include <stdlib.h>

#include "scheduler.h"

struct Process* rr(struct Process* head, struct Process* current) {
	return NULL;
}

struct Process* fcfs(struct Process* head, struct Process* current)
{
		//If current process is not done
		if (current->cycles_todo > 0)
		{
				//Do current process
				return current;
		}
		//Else start next process
		return current->next;
}

struct Process* spn(struct Process* head, struct Process* current)
{
		struct Process* shortest = head;
		current = head;

		while (current != NULL)
		{
				//If current process is shorter than shortest
				if (current->cycles_todo + current->cycles_done < shortest->cycles_todo + shortest->cycles_done)
				{
						//Set current process to newest shortest
						shortest = current;
				}
				//Enter next process
				current = current->next;
		}
		//Return shortest process
		return shortest;
}

struct Process* srt(struct Process* head, struct Process* current)
{
		struct Process* shortest = head;
		current = head;

		while (current != NULL)
		{
				//If current process is shorter than shortest
				if (current->cycles_todo < shortest->cycles_todo)
				{
						//Set current process to newest shortest
						shortest = current;
				}
				//Enter next process
				current = current->next;
		}
		//Return shortest process
		return shortest;
}

struct Process* hrrnPreemptive(struct Process* head, struct Process* current) {
	return NULL;
}

struct Process* hrrnNonPreemptive(struct Process* head, struct Process* current) {
	return NULL;
}
