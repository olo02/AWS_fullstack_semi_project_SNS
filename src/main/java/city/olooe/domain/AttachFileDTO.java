package city.olooe.domain;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponentsBuilder;

import city.olooe.controller.UploadController;
import lombok.Data;
import lombok.Getter;

@Data
public class AttachFileDTO {
	private String aname;
	private String path;
	private String uuid;
	private boolean image;

	public String getUrl() throws UnsupportedEncodingException {

		String urlString = UriComponentsBuilder.fromPath("").queryParam("aname", URLEncoder.encode(aname, "utf-8"))
				.queryParam("path", path).queryParam("uuid", uuid).queryParam("image", image).build().toUriString();

		return urlString;
	}

	public File getOriginFile() {
		return new File(UploadController.getPATH(), path + File.separator + uuid + "_" + aname);
	}

	public File getThumbFile() {
		return new File(UploadController.getPATH(), path + File.separator + "s_" + uuid + aname);
	}

}
