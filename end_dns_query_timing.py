import timeit
import start_timing
import start_timing

end = timeit.timeit()
final_time = abs(end - start_timing.start)
numberFile = open('quic_timing.txt', 'r')

#Priming read
number = numberFile.readline()
number = float(number)
print("curent time" , abs(end - start_timing.start))
final_time = final_time - number
print("the read num from file: ", number)
print(";; more precise timing of the query: ", final_time)

#numberFile2 = open('quic_timing.txt', 'w')

#f.write("%i" % (abs(end - start_timing.start))
#umberFile2.write(str(final_time)) 
#print("time: " , str(number))
#print (abs(end - start_timing.start))
