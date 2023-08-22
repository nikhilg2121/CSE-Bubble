#include<bits/stdc++.h>
using namespace std;

void solve(){
    string s;
    cin >> s;

    int i = 0;
    string s1 = "";
    while(s[i]!='_'){
        s1 += s[i];
        i++;
    }
    int opcode = stoi(s1, nullptr, 2);
    i++;

    string opCode="";
    string rs="";
    string rt="";
    string rd="";
    string shamt="";
    string offset="";
    string func="";
    string result="";
    int Func;
    switch (opcode)
    {
    case 0:
        opCode = "000000";
        while(s[i]!='_'){
            rs += s[i];
            i++;
        }
        i++;
        while(s[i]!='_'){
            rt += s[i];
            i++;
        }
        i++;
        while(s[i]!='_'){
            shamt += s[i];
            i++;
        }
        i++;
        while(s[i]!='_'){
            rd += s[i];
            i++;
        }
        i++;
        while(s[i]!='\0'){
            func += s[i];
            i++;
        }
        // cout<<func<<endl;
        Func = stoi(func, nullptr, 2);
        Func++;
        func = "";
        for( int j = 0; j<6; j++){
            func = to_string(Func%2) + func;
            Func /= 2;
        }
        result = opCode + "_" + rs +"_" + rt  + "_" +shamt + "_" +rd + "_" +func;
        break;
    case 1:
        opCode = "001110";
        break;
    case 2:
        opCode = "001111";
        break;
    case 3:
        opCode = "010000";
        break;
    case 4:
        opCode = "000101";
        break;
    case 5:
        opCode = "001101";
        break;
    case 6:
        opCode = "001100";
        break;
    case 7:
        opCode = "001011";
        break;
    case 8:
        opCode = "001010";
        break;
    case 9:
        opCode = "001001";
        break;
    case 10:
        opCode = "001000";
        break;
    case 11:
        opCode = "000111";
        break;
    case 12:
        opCode = "000110";
        break;
    case 13:
        opCode = "000100";
        break;
    case 14:
        opCode = "000011";
        break;
    case 15:
        opCode = "000010";
        break;
    case 16:
        opCode = "000001";
        break;
    default:
        break;
    }

    if(opcode >= 4 && opcode <= 16){
        while(s[i]!='_'){
            rs += s[i];
            i++;
        }
        i++;
        while(s[i]!='_'){
            rt += s[i];
            i++;
        }
        i++;
        while(s[i]!='\0'){
            offset += s[i];
            i++;
        }
        result = opCode + rs + rt + offset;
    }


    if(opcode >=1 && opcode <=3){
        while(s[i]!='\0'){
            offset += s[i];
            i++;
        }
        result = opCode + offset;
    }
    cout<<result<<endl;
}

int main(){
    int n;
    cin>>n;

    while(n--){
        solve();
    }
    return 0;
}