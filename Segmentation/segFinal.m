clear;
originalImg = imread('tt07_25.png');
cform = makecform('srgb2lab');labImg = applycform(originalImg,cform);
labImg_a = labImg(:,:,2);
labImg_b = labImg(:,:,3);
global x y;     %ȫ�ֱ���������ӵ�λ�ã�ֻѡ��һ�Σ����������ηָ�  
for ab_count = 1:2
    if(ab_count == 1)
        figure,imshow(labImg_a, []),title('a������ͼ')
        I=double(labImg_a);
        [M,N]=size(I);
        [y,x]=getpts;          
        x1=round(x);         
        y1=round(y);          
        seed=I(x1,y1);           
        Y=zeros(M,N);       
        Y(x1,y1)=1;          
        sum=seed;             
        suit=1;               
        count=1;             
        threshold = 3;   
        while count>0
            s=0;                
            count=0;
            for i=1:M
                for j=1:N
                    if Y(i,j)==1
                        if (i-1)>0 && (i+1)<(M+1) && (j-1)>0 && (j+1)<(N+1) 
                            for u= -1:1                            
                                for v= -1:1                            
                                    if   Y(i+u,j+v)==0 && abs(I(i+u,j+v)-seed)<=threshold && 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
                                        Y(i+u,j+v)=1;                       
                                        count = count + 1;
                                        s = s + I(i+u,j+v);                  
                                    end
                                end
                            end
                        end
                    end
                end
            end
            suit=suit+count;                                   
            sum=sum+s;                                  
            seed=sum/suit;                                 
        end
    elseif ab_count == 2
%         figure,imshow(labImg_b, []),title('b������ͼ')    
        I=double(labImg_b);
        [M,N]=size(I);
%         [y,x]=getpts;          
        x1=round(x);          
        y1=round(y);          
        seed=I(x1,y1);          
        Y1=zeros(M,N);       
        Y1(x1,y1)=1;          
        sum=seed;             
        suit=1;                
        count=1;             
        threshold = 3;    
        while count>0
            s=0;                
            count=0;
            for i=1:M
                for j=1:N
                    if Y(i,j)==1
                        if (i-1)>0 && (i+1)<(M+1) && (j-1)>0 && (j+1)<(N+1) 
                            for u= -1:1                          
                                for v= -1:1                            
                                    if   Y1(i+u,j+v)==0 && abs(I(i+u,j+v)-seed)<=threshold && 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
                                        Y1(i+u,j+v)=1;                      
                                        count = count + 1;
                                        s = s + I(i+u,j+v);                   
                                    end
                                end
                            end
                        end
                    end
                end
            end
            suit=suit+count;                                  
            sum=sum+s;                                  
            seed=sum/suit;                                  
        end
    end
end
        
        figure,imshow(Y&Y1),title('�ָ���')
        size(find((Y&Y1)==0),1)                                
