CC=gcc
AR=ar
OBJECTS_MAIN=main.o
FLAGS= -Wall -g

all: libclassloops.a libclassloops.so libclassrec.a libclassrec.so loops looped recursives recursived mains maindrec maindloop
loops: libclassloops.a
	# $(CC) $(FLAGS) -o loops $(OBJECTS_MAIN) libclassloops.a
looped: libclassloops.so
	# $(CC) $(FLAGS) -o looped $(OBJECTS_MAIN) ./libclassloops.so -lm
recursives: libclassrec.a
	# $(CC) $(FLAGS) -o recursived $(OBJECTS_MAIN) libclassrec.a
recursived: libclassrec.so
	# $(CC) $(FLAGS) -o recursived $(OBJECTS_MAIN) ./libclassrec.so -lm
libclassloops.a: advancedClassificationloop.o basicClassification.o
	$(AR) -rcs libclassloops.a advancedClassificationloop.o basicClassification.o
libclassloops.so: advancedClassificationloop.o basicClassification.o
	$(CC) -shared -o libclassloops.so advancedClassificationloop.o basicClassification.o
libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationloop.o: advancedClassificationloop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationloop.c -lm
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c -lm
main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a -lm
maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so -lm
maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so -lm

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindrec maindloop
