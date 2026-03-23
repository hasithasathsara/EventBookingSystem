package Q1;

import java.util.Scanner;
public class Lab02Question01 {
    public static void main(String[]args){
        Scanner scn=new Scanner(System.in);

        int employeeType=0;
        double basicSalary=0.0;
        double otHours=0.0;
        System.out.print("Enter Employee Type (1,2,3) : ");
        employeeType=scn.nextByte();
        

        System.out.print("Enter Basic Salary : ");
        basicSalary=scn.nextDouble();

        System.out.print("Enter OT hours : ");
        otHours=scn.nextDouble();

        Lab02Question01 obj=new Lab02Question01();
        double oT= obj.OtRate(employeeType,otHours);

        double totalSalary=basicSalary+oT;
        System.out.println("Total Salary = "+totalSalary);
    }
    public double OtRate(int eT,double otH){

        double otR=0.0;

        if(eT==1){
            otR=1000;
        }
        else if (eT==2){
           otR=1500;
        }
        else{
            otR=1700;
        }
        return  otR;

    }



}
