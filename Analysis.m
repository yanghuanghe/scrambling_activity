for i=10010:10010 
    I=imread(['',num2str(i),'.png']);
%     imshow(I)
    C=imagesc(I)
    fh_obj = imfreehand();
    mask = uint16(fh_obj.createMask());
    Inew = I.*mask;
    imshow(Inew)
    H=sum(Inew(:));
    F(i)=H;

end


for i=10000:10010 
    I=imread(['',num2str(i),'.png']);
    Inew = I.*mask;
    H=sum(Inew(:));
    F(i)=H;

end
G=F(10000:10010);
G=G-min(G);
G=G-G(1);

MG=max(G)/2;


for i=1:10
    if (G(i+1)-MG >= 0 && G(i)-MG <= 0)
    break;  
    end  
end
locate=i 
% 
% if (locate < 9)
%     location = locate;
% else
%     location = 10;
%     end




filename = 'int4.xlsx';
xlswrite(filename,(G'));
plot(smooth(G))
ylabel('\bfIntensity[a.u.]','FontSize',14);
xlabel('\bfFrame','FontSize',14);
% set(gca,'Fontsize',9,'FontWeight','bold','linewidth',1.5);


