package edu.poly.demoDuAn2.Controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException.BadRequest;

@Controller
public class ImageUploadController {

	@GetMapping(value = "getimage/{photo}")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> getImage(@PathVariable("photo") String photo) {
		if (!photo.equals("") || photo != null) {
			try {
				Path filename = Paths.get("uploads", photo);
				byte[] buffer = Files.readAllBytes(filename);
				ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
				return ResponseEntity.ok().contentLength(buffer.length).contentType(MediaType.parseMediaType("img/png"))
						.body(byteArrayResource);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		return ResponseEntity.badRequest().build();
	}

}
